include $(TOPDIR)/rules.mk

PKG_NAME:=iptv
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/iptv
  SECTION:=net
  CATEGORY:=Network
  TITLE:=IPTV Multicast Scanner
  DEPENDS:=+libpcap
endef

# 这里定义了如何编译源码
define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_CPPFLAGS) \
		-o $(PKG_BUILD_DIR)/iptv \
		src/iptv.c \
		$(TARGET_LDFLAGS) -lpcap
endef

define Package/iptv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iptv $(1)/usr/bin/
endef

$(eval $(call BuildPackage,iptv))
