package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        String name,name2;
        TextView t1 = findViewById(R.id.textView);
        TextView t2 = findViewById(R.id.textView2);

        Intent i = getIntent();

        name = i.getStringExtra("ed1_key");
        name2 = i.getStringExtra("ed2_key");

        t1.setText(name);
        t2.setText(name2);
    }
}
