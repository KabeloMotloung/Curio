package com.curio.services

import aws.sdk.kotlin.services.dynamodb.DynamoDbClient
import aws.sdk.kotlin.services.dynamodb.model.ScanRequest
import kotlinx.coroutines.runBlocking
import org.springframework.stereotype.Service

@Service
class DynamoDBService {

    fun getAllRecords(): List<Map<String, String>> = runBlocking {
        val itemsList = mutableListOf<Map<String, String>>()

        DynamoDbClient { region = System.getenv("AWS_REGION") }.use { dynamoDb ->
            val scanRequest = ScanRequest {
                tableName = System.getenv("AWS_TABLE_NAME")
            }

            val scanResponse = dynamoDb.scan(scanRequest)
            val items = scanResponse.items ?: emptyList()

            for (item in items) {
                val record = item.mapValues { (_, value) ->
                    value.asSOrNull() ?: value.toString()
                }
                itemsList.add(record)
            }
        }

        return@runBlocking itemsList
    }
}
