package com.curio

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cache.annotation.EnableCaching

@SpringBootApplication
@EnableCaching
class CurioApplication

fun main(args: Array<String>) {
    runApplication<CurioApplication>(*args)
}