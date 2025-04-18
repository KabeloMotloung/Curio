package com.curio.controllers

import com.curio.CurioApplication
import org.springframework.cache.annotation.Cacheable
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/api/v1/s3/")
class S3Controller(application: CurioApplication) : BaseController(application){
    @Cacheable("s3ResponseCache")
    @GetMapping
    fun get(): ResponseEntity<List<String>> {
        val urls=application.main()
        return ResponseEntity(urls, HttpStatus.OK)
    }
}