package com.curio.controllers

import com.curio.services.S3Service
import org.springframework.cache.annotation.Cacheable
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/api/v1/s3/")
class S3Controller(private val s3: S3Service) : BaseController() {
    @Cacheable("s3")
    @GetMapping
    fun get(): ResponseEntity<List<String>> {
        val urls = s3.getObjects()
        return ResponseEntity(urls, HttpStatus.OK)
    }
}