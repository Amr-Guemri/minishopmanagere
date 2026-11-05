package com.example.minishopmanager

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Suivi du cycle de vie dans Logcat
        Log.d("LIFECYCLE", "onCreate appelé")

        // Liaison avec le bouton de l'interface
        val btnNext = findViewById<Button>(R.id.btnNext)

        // Gestion du clic sur le bouton
        btnNext.setOnClickListener {
            // Affichage du Toast
            Toast.makeText(this, "Bonjour Asma AYARI !", Toast.LENGTH_SHORT).show()

            // Navigation vers ProfileActivity
            val intent = Intent(this, ProfileActivity::class.java)
            startActivity(intent)
        }
    }
}