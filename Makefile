ifeq ($(shell [ -f ./ios-reversed-headers/README.md ] && echo 1 || echo 0), 0)
all clean package install stage::
	git submodule update --init --recursive
	$(MAKE) $(MAKEFLAGS) MAKELEVEL=0 $@
else

include theos/makefiles/common.mk

APPLICATION_NAME = WiFi
WiFi_FILES = src/main.m src/WiFiApplication.mm src/DMNetworksViewController.m src/DMNetworksManager.m src/DMInformationViewController.m src/DMNetwork.m src/DMDetailViewController.m
WiFi_FRAMEWORKS = UIKit CoreGraphics
WiFi_PRIVATE_FRAMEWORKS = MobileWiFi
WiFi_CODESIGN_FLAGS = -Ssrc/entitlements.xml

ADDITIONAL_CFLAGS = -I$(THEOS_PROJECT_DIR)/ios-reversed-headers/

include $(THEOS_MAKE_PATH)/application.mk

endif
