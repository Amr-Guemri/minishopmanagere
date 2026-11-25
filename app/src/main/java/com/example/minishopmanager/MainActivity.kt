package com.example.minishopmanager

import android.content.ContentValues
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.ListView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import org.json.JSONObject

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val listView = findViewById<ListView>(R.id.listViewProducts)
        val produits = lireProduitsDepuisJSON()

        val adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, produits)
        listView.adapter = adapter

        listView.setOnItemClickListener { _, _, position, _ ->
            val produitSelectionne = produits[position]
            Toast.makeText(this, "Ajouté au panier : $produitSelectionne", Toast.LENGTH_SHORT).show()

            val dbHelper = DBHelper(this)
            val db = dbHelper.writableDatabase
            val values = ContentValues().apply {
                put("nom", produitSelectionne)
                put("prix", (50..1200).random())
            }
            db.insert("panier", null, values)
            db.close()
        }
    }

    private fun lireProduitsDepuisJSON(): ArrayList<String> {
        val liste = ArrayList<String>()
        val jsonString = assets.open("produits.json").bufferedReader().use { it.readText() }
        val jsonArray = JSONObject(jsonString).getJSONArray("produits")
        for (i in 0 until jsonArray.length()) {
            val p = jsonArray.getJSONObject(i)
            liste.add("${p.getString("nom")} - ${p.getInt("prix")} DT")
        }
        return liste
    }
}