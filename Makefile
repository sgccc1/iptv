include $(TOPDIR)/rules.mk

PKG_NAME:=iptv_scan
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/iptv_scan
  SECTION:=net
  CATEGORY:=Network
  TITLE:=IPTV Multicast Scanner
  DEPENDS:=+libpcap
endef

# 这里定义了如何编译源码
define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_CPPFLAGS) \
		-o $(PKG_BUILD_DIR)/iptv_scan \
		src/iptv_scan.c \
		$(TARGET_LDFLAGS) -lpcap
endef

define Package/iptv_scan/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iptv_scan $(1)/usr/bin/
endef

$(eval $(call BuildPackage,iptv_scan))
