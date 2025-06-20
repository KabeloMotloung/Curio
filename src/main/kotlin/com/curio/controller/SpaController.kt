package com.curio.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
class SpaController {
    @GetMapping(value = [
        "/", 
        "/the-swan/**", 
        "/pangolin-and-crocodile/**", 
        "/sidwane-tokozile/**", 
        "/the-kraal/**", 
        "/the-discovery/**",
        "/spindle-whorl/**",
        "/battle-of-torquay/**"
    ])
    fun forwardToIndex(): String {
        return "forward:/index.html"
    }
}
