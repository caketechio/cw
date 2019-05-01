import UIKit
import FlexLayout

final class SendView: BaseScrollFlexViewWithBottomSection {
    let cardView: CardView
    let addressView: AddressView
    let takeFromAddressBookButton: Button
    let paymentIdTextField: TextField
    let paymentIdContainer: UIView
    let cryptoAmountTextField: TextField
    let fiatAmountTextField: TextField
    let currenciesRowViev: UIView
    let currenciesContainer: UIView
    let estimatedFeeTitleLabel: UILabel
    let estimatedFeeValueLabel: UILabel
    let estimatedFeeContriner: UIView
    let estimatedDescriptionLabel: UILabel
    let sendButton: PrimaryLoadingButton
    let walletContainer: UIView
    let walletNameLabel: UILabel
    let cryptoAmountValueLabel: UILabel
    let cryptoAmountTitleLabel: UILabel
    let sendAllButton: TransparentButton
    let cryptoAmonutContainer: UIView
    let scanQrForPaymentId: UIButton
    
    required init() {
        cardView = CardView()
        addressView = AddressView(placeholder: "Monero address")
        takeFromAddressBookButton = SecondaryButton(title: NSLocalizedString("A", comment: ""))
        paymentIdTextField = TextField(placeholder: "Payment ID (optional)", fontSize: 15, isTransparent: false)
        paymentIdContainer = UIView()
        cryptoAmountTextField = TextField(placeholder: "0.0000", fontSize: 19, isTransparent: false)
        fiatAmountTextField = TextField(placeholder: "0.0000", fontSize: 19, isTransparent: false)
        currenciesRowViev = UIView()
        currenciesContainer = UIView()
        estimatedFeeTitleLabel = UILabel(fontSize: 12)
        estimatedFeeValueLabel = UILabel(fontSize: 12)
        estimatedFeeContriner = UIView()
        estimatedDescriptionLabel = UILabel.withLightText(fontSize: 12)
        sendButton = PrimaryLoadingButton()
        walletContainer = CardView()
        walletNameLabel = UILabel()
        cryptoAmountValueLabel = UILabel()
        cryptoAmountTitleLabel = UILabel()
        sendAllButton = TransparentButton(title: NSLocalizedString("all", comment: ""))
        cryptoAmonutContainer = UIView()
        scanQrForPaymentId = UIButton()
        super.init()
    }
    
    override func configureView() {
        super.configureView()
        
        walletNameLabel.font = applyFont(ofSize: 17)
        walletNameLabel.textColor = .wildDarkBlue
        estimatedFeeValueLabel.numberOfLines = 0
        estimatedFeeValueLabel.textAlignment = .right

        cryptoAmountTitleLabel.font = applyFont(ofSize: 14)
        cryptoAmountTitleLabel.textAlignment = .right
        
        cryptoAmountValueLabel.textAlignment = .right
        cryptoAmountValueLabel.font = applyFont(ofSize: 26)
        cryptoAmountTextField.textField.keyboardType = .decimalPad
        
        let cryptoAmountTextFieldLeftView = UILabel(text: "XMR:")
        cryptoAmountTextFieldLeftView.font = applyFont()
        cryptoAmountTextFieldLeftView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let cryptoAmountTextFieldRightView = UIView()
        cryptoAmountTextFieldRightView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        cryptoAmountTextField.textField.leftView = cryptoAmountTextFieldLeftView
        cryptoAmountTextField.textField.leftViewMode = .always
        
        cryptoAmountTextField.textField.rightView = cryptoAmountTextFieldRightView
        cryptoAmountTextField.textField.rightViewMode = .always
        
        let fiatAmountTextFieldLeftView = UILabel(text: "USD:")
        fiatAmountTextFieldLeftView.font = applyFont()
        fiatAmountTextFieldLeftView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        fiatAmountTextField.textField.keyboardType = .decimalPad
        fiatAmountTextField.textField.leftView = fiatAmountTextFieldLeftView
        fiatAmountTextField.textField.leftViewMode = .always
        
        sendAllButton.setTitleColor(UIColor.wildDarkBlue, for: .normal)
        sendAllButton.titleLabel?.font = applyFont(ofSize: 11)
        
        sendButton.setTitle(NSLocalizedString("send", comment: ""), for: .normal)
        scanQrForPaymentId.setImage(UIImage(named: "qr_code_icon"), for: .normal)
        scanQrForPaymentId.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        scanQrForPaymentId.backgroundColor = .clear
        scanQrForPaymentId.layer.cornerRadius = 5
        scanQrForPaymentId.backgroundColor = UIColor.whiteSmoke
    }
    
    override func configureConstraints() {
        cryptoAmonutContainer.flex.define { flex in
            flex.addItem(cryptoAmountTitleLabel)
            flex.addItem(cryptoAmountValueLabel)
        }
        
        walletContainer.flex.direction(.row).padding(20).justifyContent(.spaceBetween).define { flex in
            flex.addItem(walletNameLabel).height(20)
            flex.addItem(cryptoAmonutContainer)
        }
        
        currenciesContainer.flex
            .justifyContent(.spaceBetween)
            .define { flex in
                flex.addItem(cryptoAmountTextField).width(100%).marginBottom(25)
                flex.addItem(fiatAmountTextField).width(100%)
                flex.addItem(sendAllButton).height(40).marginLeft(10).position(.absolute).right(-5).top(-5)
        }
        
        estimatedFeeContriner.flex.direction(.row).justifyContent(.spaceBetween).alignItems(.start).define { flex in
            flex.addItem(estimatedFeeTitleLabel)
            flex.addItem(estimatedFeeValueLabel)
        }
        
        paymentIdContainer.flex.define { flex in
            flex.addItem(paymentIdTextField).width(100%)
            flex.addItem(scanQrForPaymentId).width(35).height(35).position(.absolute).right(0).top(-10)
        }
        
        cardView.flex.alignItems(.center).padding(30, 20, 30, 20).define { flex in
            flex.addItem(addressView).width(100%)
            flex.addItem(paymentIdContainer).width(100%).marginTop(30)
            
            flex.addItem(currenciesContainer).marginTop(25).width(100%)
            
            flex.addItem(estimatedFeeContriner).marginTop(20).width(100%)
            flex.addItem(estimatedDescriptionLabel).marginTop(20).width(100%)
        }
        
        rootFlexContainer.flex.padding(20).backgroundColor(.clear).define { flex in
            flex.addItem(walletContainer)
            flex.addItem(cardView).marginTop(20)
        }
        
        bottomSectionView.flex.padding(20).define { flex in
            flex.addItem(sendButton).height(56)
        }
    }
}
