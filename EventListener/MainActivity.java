package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText ed1 = findViewById(R.id.editTextTextPersonName);
        EditText ed2 = findViewById(R.id.editTextTextPersonName2);
        Button bt1 = findViewById(R.id.button);

        bt1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(MainActivity.this,MainActivity2.class);

                i.putExtra("ed1_key",ed1.getEditableText().toString());
                i.putExtra("ed2_key",ed2.getEditableText().toString());

                startActivity(i);
            }
        });


    }
}
