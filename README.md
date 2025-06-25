# POC Hospital Orizonte


4. Build the container images: `docker-compose build --progress=plain`.
5. Create and run containers: `docker-compose up -d`
6. Open IRIS managementportal: http://localhost:52773/csp/sys/UtilHome.csp  
6. Open IRIS terminal: http://localhost:52773/terminal/    
6. Open Webgateway managementportal: http://localhost:52773/csp/bin/Systems/Module.cxw

WSDL



http://localhost:52773/csp/healthshare/pocho/services/pocho.wsdl.WSDLApi.cls?wsdl
http://localhost:52773/api/wsdl/pocho/pocho.wsdl.WSDLApi.cls?wsdl


http://localhost:52773/csp/healthshare/pocho/services/pocho.api.api.cls?wsdl




7. Open Swagger to Access the APIs and input demo data in many ways: http://localhost:52773/swagger-ui/index.html?url=http://localhost:52773/api/pocho/_spec#/

Additonal commands

- Stop Demo: `docker-compose stop`
- Start Demo: `docker-compose start`
- Delete all docker resources of the demo: `docker-compose down`

