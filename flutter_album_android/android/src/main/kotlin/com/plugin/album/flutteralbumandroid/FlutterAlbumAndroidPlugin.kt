package com.plugin.album.flutteralbumandroid

import com.album.Album
import com.album.entity.AlbumEntity
import com.album.ui.widget.SimpleAlbumListener
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterAlbumAndroidPlugin : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_album_android")
            channel.setMethodCallHandler(FlutterAlbumAndroidPlugin())
            registry = registrar
        }

        lateinit var registry: Registrar
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "startAlbum") {
            startAlbum(result)
        } else {
            result.notImplemented()
        }
    }

    private fun startAlbum(result: Result) {
        Album.getInstance().apply {
            albumListener = object : SimpleAlbumListener() {
                override fun onAlbumResources(list: List<AlbumEntity>) {
                    result.success(list[0].path)
                }

                override fun onAlbumActivityFinish() {
                    result.success("onAlbumActivityFinish")
                }

                override fun onAlbumActivityBackPressed() {
                    result.success("onAlbumActivityBackPressed")

                }
            }
        }.start(registry.activity())
    }
}
