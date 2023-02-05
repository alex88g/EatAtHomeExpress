//
//  Extensions.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-05.
//

import SwiftUI

//custom bottom sheet extracting from native swiftui
extension View{
  @ViewBuilder
    func bottomSheet<Content: View>(
        presentattionDetents: Set<PresentationDetent>,
        isPresented: Binding<Bool>,
        dragIndicator: Visibility = .visible,
        sheetCornerRadius: CGFloat?,
        largestUndimmedIdentifier: UISheetPresentationController.Detent.Identifier = .large,
        isTransparentBG: Bool = false,
        interactiveDisabled: Bool = true,
        @ViewBuilder content: @escaping ()->Content,
        onDismiss: @escaping ()->()
        
    )->some View{
        self
        
            .sheet(isPresented: isPresented){
                onDismiss()
                   
                   } content: {
                content()
                           .presentationDetents(presentattionDetents)
                           .presentationDragIndicator(dragIndicator)
                           .interactiveDismissDisabled(interactiveDisabled)
                           .onAppear{
                               //custom code for bottom sheet
                               //finding the presented view controller

                             
                               guard let windows = UIApplication.shared.connectedScenes.first as?
                                        UIWindowScene else{
                                   return
                               }
                               //from this extracting presentation controller
                               if let controller =
                                    windows.windows.first?.rootViewController?
                                .presentedViewController,let sheet = controller.presentationController as? UISheetPresentationController{
                                   //set properties with sheet contoller

                                   sheet.largestUndimmedDetentIdentifier = largestUndimmedIdentifier
                                   sheet.preferredCornerRadius = sheetCornerRadius

                               }else{
                                   print("NO CONTROLLER FOUND")
                               }

                           }
            }
        }
    }
