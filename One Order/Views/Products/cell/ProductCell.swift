//
//  ProductCell.swift
//  One Order
//
//  Created by younan on 09/10/2023.
//

import SwiftUI

struct ProductCell: View {
    
    var body: some View {
        VStack {
            productHeader
            addToCartButton
            
            Divider()
                .padding()
        }
    }
    
    
    // Product Header Contain Image, title, price
    var productHeader: some View {
        VStack {
            productImgAndPrice
            productTitleAndQuantity
        }
    }
    
    var productImgAndPrice: some View {
        ZStack(alignment:.topTrailing) {
            Image("productImg")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity,maxHeight: 150,alignment: .top)
            
            Text("223 EGP")
                .font(.system(size: 12))
                .padding()
                .foregroundColor(Color.white)
                .background(Color.black)
                .padding(.top,22)
                .frame(maxWidth: 100,maxHeight: 150, alignment: .topTrailing)
        }
    }
    
    var productTitleAndQuantity: some View {
        HStack {
            Text("Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops")
                .font(.system(size: 12))
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom,4)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            addQuantity
        }
    }
    
    
    var addQuantity: some View {
        HStack {
            
            Button {
                
            } label: {
                customQuantityButton(imageName: "plus")
            }
            
            Text("0")
                .frame(width: 25,height: 25)
            
            
            Button {
                
            } label: {
                customQuantityButton(imageName: "minus")
            }
            
        }
        .padding(.trailing,22)
        .frame(maxWidth: .infinity,alignment: .trailing)
        
    }
    
    
    var addToCartButton: some View {
        HStack(alignment: .center) {
            Button {
                
            } label: {
                addCartView
            }
        }
        .padding()
        .background(customBlackStroke(width: 120, height: 30))
        .frame(width: 120,height: 40)
        
    }
    
    
    var addCartView: some View {
        HStack{
            
            Text("Add To Cart")
                .font(.system(size: 12))
                .foregroundColor(Color.black)
            
            
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.black)
                .frame(width: 8,height: 8)
        }
    }
    
    
    func customQuantityButton(imageName: String) -> some View {
        ZStack {
            Image(systemName: imageName)
                .foregroundColor(Color.black)
                .background(customBlackStroke(width: 25, height: 25))
                .frame(width: 25, height: 25)
        }
    }
    
    func customBlackStroke(width: Int,height: Int) -> some View {
        ZStack {
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
                .frame(width: CGFloat(width), height: CGFloat(height))
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell()
            .previewLayout(.sizeThatFits)
    }
}
