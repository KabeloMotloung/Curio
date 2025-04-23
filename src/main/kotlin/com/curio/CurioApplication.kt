package com.curio

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cache.annotation.EnableCaching

@SpringBootApplication
@EnableCaching
class CurioApplication
//Starts up program note the @Cacheable annotation for controller caching
fun main(args: Array<String>) {
    runApplication<CurioApplication>(*args)
}