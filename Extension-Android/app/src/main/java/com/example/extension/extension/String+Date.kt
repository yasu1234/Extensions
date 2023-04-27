package com.example.extension.extension

import java.lang.IllegalArgumentException
import java.text.SimpleDateFormat
import java.util.*

fun String.toDate(pattern: String): Date? {
    val format = try {
        SimpleDateFormat(pattern, Locale.JAPAN)
    } catch (e: IllegalArgumentException) {
        null
    }

    return format?.parse(this)
}