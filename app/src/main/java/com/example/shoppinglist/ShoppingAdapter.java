package com.example.shoppinglist;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class ShoppingAdapter
        extends RecyclerView.Adapter<ShoppingAdapter.ViewHolder> {

    public class ViewHolder extends RecyclerView.ViewHolder{
        public TextView shoppingItem;
        public Button done_button;

        public ViewHolder(View view){
            super(view);
            shoppingItem = (TextView)view.findViewById(R.id.shoppingItem);
            done_button = (Button)view.findViewById(R.id.done_button);
        }
    }

    private List<ShoppingItem> mShoppingList;

    public ShoppingAdapter(List<ShoppingItem> shoppinglist){
        mShoppingList = shoppinglist;
    }

    public void addItem(String itemName){
        mShoppingList.add(new ShoppingItem(itemName));
    }

    @Override
    public ShoppingAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType){
        Context context = parent.getContext();
        LayoutInflater inflater = LayoutInflater.from(context);
        View contactView = inflater.inflate(R.layout.shoppingitem,parent,false);
        ViewHolder viewHolder = new ViewHolder(contactView);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ShoppingAdapter.ViewHolder holder, int position){
        ShoppingItem shoppingitem = mShoppingList.get(position);
        TextView textView = holder.shoppingItem;
        textView.setText(shoppingitem.getItem());
        Button button = holder.done_button;
    }

    @Override
    public int getItemCount(){
        return mShoppingList.size();
    }
}
