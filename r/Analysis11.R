data <- read_csv("remote_work_impact.csv")
str(data)
head(data)

burnout_by_gender <- data %>%
  count(Gender, Work_Arrangement, Burnout_Level) %>%
  group_by(Gender, Work_Arrangement) %>%
  mutate(Percentage = n / sum(n) * 100) %>%
  ungroup()
  

kable(burnout_by_gender, caption = "Burnout Level by Gender")

ggplot(burnout_by_gender, aes(x = Work_Arrangement,
                              y = Percentage,
                              fill = Burnout_Level)) +
  geom_col(position = "dodge") + 
  facet_wrap(~Gender) + 
  labs(
    title = "Burnout Levels by Work Arrangement and Gender",
    x = "Work Arrangement",
    y = "Percentage (%)",
    fill = "Burnout Level"
  ) + 
  theme_minimal() + 
  scale_fill_brewer(palette = "RdYlGn", direction = -1) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

burnout_by_arrangement <- data %>%
  group_by(Work_Arrangement, Burnout_Level) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

chisq.test(table(data$Work_Arrangement, data$Burnout_Level))

ggplot(burnout_by_arrangement,
       aes(x = Work_Arrangement, y = Percentage, fill = Burnout_Level)) +
  geom_col(width = 0.6) + 
  scale_fill_manual(values = c("Low" = "#A6D8A0", "Medium" = "#F9CB8F", "High" = "#F38D8D")) + 
  labs(
    x = "Work Type",
    y = "Percentage of Employees",
    fill = "Burnout Level"
  ) + 
  theme_minimal() + 
  theme(
    panel.grid = element_blank(),
    axis.text = element_text(size = 11), 
    legend.position = "top"
  )

mental_health_burnout <- data %>%
  group_by(Mental_Health_Status, Burnout_Level) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = (Count / sum(Count)) *100)

ggplot(mental_health_burnout, aes(x = Mental_Health_Status, y = Percentage, fill = Burnout_Level)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Burnout Levels by Mental Health Status", x = "Mental Health Condition", y = "Percentage (%)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

data <- data %>% 
  mutate(Age_Group = case_when(
    Age < 30 ~ "Under 30",
    Age >= 30 & Age < 40 ~ "30-39",
    Age >= 40 & Age < 50 ~ "40-49",
    Age >= 50 ~ "50+"
  ))

burnout_by_age <- data %>%
  group_by(Age_Group, Burnout_Level) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = (Count / sum(Count)) * 100)

ggplot(burnout_by_age, aes(x = Age_Group, y = Percentage, fill = Burnout_Level)) +
  geom_col() + 
  scale_fill_brewer(palette = "Pastel1") +
  theme_minimal()

ggplot(burnout_by_age, 
       aes(x = Age_Group, 
           y = Percentage, 
           fill = Burnout_Level)) +
  
  geom_col(width = 0.6, color = "white", linewidth = 0.3) +  # Clean white outlines
  
  scale_fill_manual(values = c(
    "Low" = "#7bc8a4",   
    "Medium" = "#ffb347", 
    "High" = "#ff6b6b"    
  )) +
  
  labs(
    x = "Age Group", 
    y = "Percentage (%)",
    fill = "Burnout Level"
  ) +
  
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "top",
    panel.grid.major.x = element_blank(),
    plot.title = element_text(hjust = 0.5, face = "bold")
  ) +
  
  geom_text(aes(label = paste0(round(Percentage), "%")),
            position = position_stack(vjust = 0.5),
            color = "white",
            size = 3.8)

salary_order <- c("Under $40K", "$40K-60K", "$60K-80K", "$80K-100K", "$100K-120K", "$120K+") 
data$Salary_Range <- factor(data$Salary_Range, levels = salary_order)


