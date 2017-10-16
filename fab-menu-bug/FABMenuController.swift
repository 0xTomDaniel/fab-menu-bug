//
//  FABMenuTestController.swift
//  fab-menu-bug
//
//  Created by Tom Daniel D. on 10/16/17.
//  Copyright © 2017 informu. All rights reserved.
//

import Material

class FABMenuTestController: FABMenuController {
    fileprivate var fabButton: FABButton!
    fileprivate var navigationMenuItem: FABMenuItem!
    
    open override func prepare() {
        super.prepare()

        prepareFABMenu()
    }
}

private extension FABMenuTestController {
    func prepareFABMenu() {
        fabButton = FABButton(image: Icon.cm.add, tintColor: Color.grey.darken3)
        fabButton.pulseColor = .darkGray
        fabButton.backgroundColor = Color.white
        
        navigationMenuItem = FABMenuItem()
        navigationMenuItem.title = "menu item 1"
        navigationMenuItem.titleLabel.textColor = Color.white
        navigationMenuItem.titleLabel.backgroundColor = Color.deepOrange.lighten3
        navigationMenuItem.titleLabelPosition = .right
        navigationMenuItem.fabButton.image = Icon.cm.play
        navigationMenuItem.fabButton.tintColor = Color.white
        navigationMenuItem.fabButton.pulseColor = .white
        navigationMenuItem.fabButton.backgroundColor = Color.deepOrange.lighten2
        navigationMenuItem.fabButton.addTarget(self, action: #selector(handleNavigationMenuItem(button:)), for: .touchUpInside)
        
        fabMenu.fabButton = fabButton
        fabMenu.fabMenuItems = [navigationMenuItem]
        fabMenuBacking = .none
        
        view.layout(fabMenu).bottom(17).left(10).size(CGSize(width: 56, height: 56))
    }
}

extension FABMenuTestController {
    @objc
    fileprivate func handleNavigationMenuItem(button: UIButton) {
        fabMenu.close()
        fabMenu.fabButton?.animate(.rotate(0))
    }
}

extension FABMenuTestController {
    @objc
    open func fabMenuWillOpen(fabMenu: FABMenu) {
        fabMenu.fabButton?.animate(.rotate(45))
        
        print("fabMenuWillOpen")
    }
    
    @objc
    open func fabMenuDidOpen(fabMenu: FABMenu) {
        print("fabMenuDidOpen")
    }
    
    @objc
    open func fabMenuWillClose(fabMenu: FABMenu) {
        fabMenu.fabButton?.animate(.rotate(0))
        
        print("fabMenuWillClose")
    }
    
    @objc
    open func fabMenuDidClose(fabMenu: FABMenu) {
        print("fabMenuDidClose")
    }
    
    @objc
    open func fabMenu(fabMenu: FABMenu, tappedAt point: CGPoint, isOutside: Bool) {
        print("fabMenuTappedAtPointIsOutside", point, isOutside)
        
        guard isOutside else {
            return
        }
        
        // Do something ...
    }
}
