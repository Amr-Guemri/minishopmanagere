package com.example.minishopmanager
import android.content.Intent
import android.content.SharedPreferences
import android.os.Bundle
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
class LoginActivity : AppCompatActivity() {
    private lateinit var prefs: SharedPreferences
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
        val etUserName = findViewById<EditText>(R.id.etUserName)
        val cbRemember = findViewById<CheckBox>(R.id.cbRemember)
        val btnLogin = findViewById<Button>(R.id.btnLogin)
        prefs = getSharedPreferences("ShopPrefs", MODE_PRIVATE)
        etUserName.setText(prefs.getString("USER", ""))
        cbRemember.isChecked = prefs.getBoolean("REMEMBER", false)
        btnLogin.setOnClickListener {
            val editor = prefs.edit()
            if (cbRemember.isChecked) {
                editor.putString("USER", etUserName.text.toString())
                editor.putBoolean("REMEMBER", true)
            } else {
                editor.clear()
            }
            editor.apply()
            startActivity(Intent(this, MainActivity::class.java))
            finish()
        }
    }
}