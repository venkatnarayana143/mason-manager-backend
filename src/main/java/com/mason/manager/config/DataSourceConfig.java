package com.mason.manager.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.sql.DataSource;
import java.net.URI;
import java.net.URISyntaxException;

@Configuration
@Profile("prod")
public class DataSourceConfig {

    @Value("${DATABASE_URL}")
    private String databaseUrl;

    @Bean
    public DataSource dataSource() throws URISyntaxException {
        // Parse the DATABASE_URL (postgresql://user:pass@host:port/db)
        String cleanUrl = databaseUrl;
        if (cleanUrl.startsWith("jdbc:")) {
            cleanUrl = cleanUrl.substring(5);
        }

        URI dbUri = new URI(cleanUrl);

        String username = dbUri.getUserInfo().split(":")[0];
        String password = dbUri.getUserInfo().split(":")[1];

        String host = dbUri.getHost();
        int port = dbUri.getPort();
        if (port == -1) {
            port = 5432; // Default PostgreSQL port
        }
        String path = dbUri.getPath();

        // Construct the standard JDBC URL with SSL enabled
        String dbUrl = "jdbc:postgresql://" + host + ":" + port + path + "?sslmode=require";

        System.out.println("DEBUG: Raw DATABASE_URL length: " + (databaseUrl != null ? databaseUrl.length() : "null"));
        System.out.println(
                "DEBUG: Connecting to: " + "jdbc:postgresql://" + host + ":" + port + path + "?sslmode=require");

        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(dbUrl);
        config.setUsername(username);
        config.setPassword(password);
        config.setDriverClassName("org.postgresql.Driver");

        // Optimize connection pool for cloud
        config.setMaximumPoolSize(5);
        config.setMinimumIdle(1);
        config.setConnectionTimeout(30000);
        config.setIdleTimeout(600000);
        config.setMaxLifetime(1800000);

        return new HikariDataSource(config);
    }
}
