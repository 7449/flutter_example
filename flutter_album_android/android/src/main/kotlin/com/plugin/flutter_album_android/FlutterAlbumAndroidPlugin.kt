package com.plugin.flutter_album_android

import android.content.Context
import com.album.Album
import com.album.entity.AlbumEntity
import com.album.ui.widget.SimpleAlbumListener
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** FlutterAlbumAndroidPlugin */
public class FlutterAlbumAndroidPlugin: FlutterPlugin, MethodCallHandler {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext()
    val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_album_android")
    channel.setMethodCallHandler(FlutterAlbumAndroidPlugin());
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {

    lateinit var context: Context

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_album_android")
      channel.setMethodCallHandler(FlutterAlbumAndroidPlugin())
      context = registrar.activity()
    }

  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
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
    }.start(context)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
  }
}
