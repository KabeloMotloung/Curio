package com.curio

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class CurioApplication

fun main(args: Array<String>) {
	runApplication<CurioApplication>(*args)
}
