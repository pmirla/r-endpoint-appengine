library(containerit)

dockerfile <- dockerfile("schedule.R", copy = "script_dir", soft = TRUE)
write(dockerfile, file = "Dockerfile")

