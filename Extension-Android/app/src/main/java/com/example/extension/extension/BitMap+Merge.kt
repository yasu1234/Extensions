package com.example.extension.extension

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint

fun Bitmap.mergeBitmap(blendBitmap: Bitmap): Bitmap? {
    val width = this.width
    val height = this.height
    val newBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
    val canvas = Canvas(newBitmap)
    canvas.drawBitmap(this, 0F, 0F, null as Paint?)
    val disWidth = (width - blendBitmap.width) / 2
    val disHeight = (height - blendBitmap.height) / 2
    canvas.drawBitmap(blendBitmap, disWidth.toFloat(), disHeight.toFloat(), null as Paint?)
    return newBitmap
}