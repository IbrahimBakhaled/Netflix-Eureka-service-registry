package cdg.releve.netflix.eureka.server;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class NetflixEurekaServerApplicationLauncher {
    public static void main(String[] args) {
        SpringApplication.run(NetflixEurekaServerApplicationLauncher.class, args);
    }
}
