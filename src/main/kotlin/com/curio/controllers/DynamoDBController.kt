package com.curio.controllers

import com.curio.services.DynamoDBService
import org.springframework.cache.annotation.Cacheable
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/api/v1/dynamoDB/")
class DynamoDBController(private val dynamoDB: DynamoDBService) : BaseController() {

    @Cacheable("dynamoDB")
    @GetMapping
    fun get(): ResponseEntity<List<Map<String, String>>> {
        val rows = dynamoDB.getAllRecords()
        return ResponseEntity(rows, HttpStatus.OK)
    }

}