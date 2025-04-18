package com.curio

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import aws.sdk.kotlin.services.s3.S3Client
import kotlinx.coroutines.runBlocking

@SpringBootApplication
class CurioApplication {

	fun main() = runBlocking {
		val s3Client = S3Client { region = "eu-west-1" }
		val buckets = s3Client.listBuckets()
		buckets.buckets?.forEach { println(it.name) }
	}

}

fun main(args: Array<String>) {
	runApplication<CurioApplication>(*args)
}

