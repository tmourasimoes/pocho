# POC Hospital Orizonte


4. Build the container images: `docker-compose build --progress=plain`.
5. Create and run containers: `docker-compose up -d`
6. Open IRIS managementportal: http://localhost:22773/csp/sys/UtilHome.csp  
6. Open IRIS terminal: http://localhost:22773/terminal/    
6. Open Webgateway managementportal: http://localhost:22773/csp/bin/Systems/Module.cxw

7. Open Swagger to Access the APIs and input demo data in many ways: http://localhost:22773/swagger-ui/index.html?url=http://localhost:22773/api/demo/_spec#/

Additonal commands

- Stop Demo: `docker-compose stop`
- Start Demo: `docker-compose start`
- Delete all docker resources of the demo: `docker-compose down`

