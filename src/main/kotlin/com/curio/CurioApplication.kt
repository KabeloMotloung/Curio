package com.curio

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class CurioApplication
//Starts up program note the @Cacheable annotation for controller caching
fun main(args: Array<String>) {
	runApplication<CurioApplication>(*args)
}
