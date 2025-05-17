package com.example.hyperwebapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@SpringBootApplication
public class HyperWebAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(HyperWebAppApplication.class, args);
    }

    @Controller
    public static class WebController {

        @GetMapping("/")
        public String homePage(@RequestParam(name = "name", defaultValue = "Docker Enthusiast") String name,
                               Model model) {
            model.addAttribute("name", name);
            return "index";
        }
    }
}
