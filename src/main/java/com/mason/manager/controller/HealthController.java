package com.mason.manager.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

@RestController
public class HealthController {

    @GetMapping("/health")
    public Map<String, String> healthCheck() {
        Map<String, String> status = new HashMap<>();
        status.put("status", "UP");
        status.put("message", "Mason Manager Backend is running");
        return status;
    }

    @GetMapping("/")
    public String root() {
        return "Mason Manager Backend is running! Access API at /api/employees";
    }
}
