# Softuni Jenkins CI/CD exercise 

## Tasks TODO

1. Create Job CI

2. Add Build and Test steps:  
	- npm install  
	- npm audit  
	- npm test   
	
3. Set Ngrok to serve jenkins server:  
![NgrokPage](Screenshots/Ngrok.png)  


4. Add project github webhook (the link from ngrok)  
![GithubWebhookPage](Screenshots/Webhook.png)  


5. Create trigger in Jenkins  
![TriggerPage](Screenshots/Trigger.png)  


6. Build docker image:  
	- Log in Docker  
	- Push to Dockerhub  
	- Add variable for versions to docker  
	- Add user password for docker hub credentials  

![DockerSettingsPage](Screenshots/Docker_settings.png)  

![DockerSettingsPage](Screenshots/Docker_with_variables.png)   

7. Create job CD:  
	- Pull from docker  
	
![DockerCDPage](Screenshots/CD_for_docker.png)   

8. Add docker-compose.yml to the project  

9. Post action in the CI to execute the CD if the Ci passes  

10. Fix DockerHub latest version

![DockerLatestFix](Screenshots/Docker_fix_latest_version.png)   

11. Final Jenkins Result

![JenkinsJobs](Screenshots/Jenkins_jobs.png)   

![DockerHub](Screenshots/DockerHub.png)   

![Docker](Screenshots/Docker.png)   
