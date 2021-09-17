package com.example.shoppinglist;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

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

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    boolean add = false;
    RecyclerView shoppingList;
    EditText mEditText;
    Button button;
    ArrayList<ShoppingItem> items;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        shoppingList = (RecyclerView) findViewById(R.id.shoppinglist);
        items = new ArrayList<ShoppingItem>();
        ShoppingAdapter shoppingAdapter = new ShoppingAdapter(items);

        shoppingList.setAdapter(shoppingAdapter);
        shoppingList.setLayoutManager(new LinearLayoutManager(this));

        EditText editText = (EditText) findViewById(R.id.itemInput);
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
                v.setText("");
                return handled;
            }
        });
    }
    public void changeField(CharSequence item){
        items.add(new ShoppingItem(item.toString()));
    }



}