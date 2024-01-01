package com.example.helloDocker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.example.helloDocker.service.HelloService;

@RestController
public class HelloController {
@Autowired
HelloService helloService;

}
