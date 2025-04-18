package com.curio.services

import aws.sdk.kotlin.services.s3.S3Client
import aws.sdk.kotlin.services.s3.model.ListObjectsV2Request
import kotlinx.coroutines.runBlocking
import org.springframework.stereotype.Service


@Service
class S3Service {
    fun getObjects(): List<String> = runBlocking {
        val region = System.getenv("AWS_REGION")
        val bucketName = System.getenv("AWS_BUCKET_NAME")
        val s3 = S3Client { this.region = region }

        val listRequest = ListObjectsV2Request {
            this.bucket = bucketName
        }

        val response = s3.listObjectsV2(listRequest)

        return@runBlocking response.contents?.mapNotNull { obj ->
            obj.key?.let { key ->
                "https://$bucketName.s3.$region.amazonaws.com/$key"
            }
        } ?: emptyList()
    }
}