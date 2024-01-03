package com.example.helloDocker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.example.helloDocker.service.HelloService;
@RestController

public class HelloController {
@Autowired
HelloService helloService;

//@PostMapping("app")
//public ResponseEntity<?> getAllTutorials(@RequestBody String data) {
//	System.out.println(data);
//  try {
//	  List<Integer>l1=Arrays.asList(1,2,3,5,6,4,8,6,5,2);
//    
//
//    return new ResponseEntity<>(l1, HttpStatus.OK);
//  } catch (Exception e) {
//    return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
//  }
//}

}
