package com.curio.controllers

import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.server.ResponseStatusException

@CrossOrigin
abstract class BaseController() {
    //to handle errors
    @ExceptionHandler(Throwable::class)
    fun errorHandler(throwable: Throwable): ResponseEntity<String> {
        when (throwable) {
            is ResponseStatusException -> return ResponseEntity(throwable.reason, throwable.statusCode)
        }

        return ResponseEntity("An internal server error occurred.", HttpStatus.INTERNAL_SERVER_ERROR)
    }
}