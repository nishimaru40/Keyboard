package com.example.inputcontrol;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;

import java.text.DateFormat;
import java.util.Calendar;

public class MainActivity3 extends AppCompatActivity {
    DateFormat fmtDateAndTime = DateFormat.getDateTimeInstance();
    Calendar myCalendar = Calendar.getInstance();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main3);

        TextView txt = (TextView)findViewById(R.id.textView5);
        String extra = getIntent().getStringExtra("extra");
        txt.setText(txt.getText()+" "+extra);

        ToggleButton toggle = (ToggleButton) findViewById(R.id.toggleButton1);
            toggle.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    TextView text1 =(TextView)findViewById(R.id.textView);
                        if (isChecked) {
                            text1.setText("Toggle ON");
                        } else {
                            text1.setText("Toggle OFF");
                        }
                }
            });

        Spinner spinner = (Spinner) findViewById(R.id.planets_spinner);
            ArrayAdapter<CharSequence> adapter =
                    ArrayAdapter.createFromResource(this,
                    R.array.planets_array, android.R.layout.simple_spinner_item);
            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
            spinner.setAdapter(adapter);

        Button btnDate = (Button) findViewById(R.id.btnChangeDate);
        btnDate.setOnClickListener(new View.OnClickListener() {
        public void onClick(View v) {
            new DatePickerDialog(MainActivity3.this, d,
                  