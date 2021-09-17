package com.example.shoppinglist;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.google.android.material.textfield.TextInputEditText;

public class MainActivity extends AppCompatActivity {

    boolean add = false;
    LinearLayout shoppinglist;
    EditText mEditText;
    Button button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText editText = (EditText) findViewById(R.id.shoppingListInputBox);
        editText.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                boolean handled = false;
                if (actionId == EditorInfo.IME_ACTION_DONE) {
                    InputMethodManager inputManager = (InputMethodManager) v.getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
                    inputManager.hideSoftInputFromWindow(v.getWindowToken(),InputMethodManager.HIDE_NOT_ALWAYS);
                    changeField(v.getText());
                    handled = true;
                }
                return handled;
            }
        });
    }
    public void changeField(CharSequence item){
        TextView temp1 = (TextView)findViewById(R.id.textView);
        temp1.setText(item);
    }

    public void addItem(View view){
//        Button button = (Button)findViewById(R.id.addNew);
//        if(add){
//            add = false;
//            button.setBackgroundColor(0xFFA8E6CF);
//        }
//        else{
//            add = true;
//            button.setBackgroundColor(0xFFFFD3B6);
//        }
        //adding a new textview in the linear layout

    }

}