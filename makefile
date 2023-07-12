SRC_DIR := ./src
DATA_DIR := ./data

BU := butane
BUFLAGS := --pretty --strict

IV := ignition-validate

envydious.ign: $(SRC_DIR)/envydious.ign
	$(IV) $< && cp $< $@

$(SRC_DIR)/auto-update.ign: $(SRC_DIR)/auto-update.bu $(DATA_DIR)/updates-strategy.toml
	$(BU) $(BUFLAGS) --files-dir $(DATA_DIR)/ $< --output $@

$(SRC_DIR)/envydious.ign: $(SRC_DIR)/envydious.bu $(SRC_DIR)/auto-update.ign \
$(SRC_DIR)/firewall.ign $(SRC_DIR)/storage.ign $(SRC_DIR)/users.ign
	$(BU) $(BUFLAGS) --files-dir $(SRC_DIR)/ $< --output $@

$(SRC_DIR)/firewall.ign: $(SRC_DIR)/firewall.bu $(DATA_DIR)/iptables $(DATA_DIR)/ip6tables
	$(BU) $(BUFLAGS) --files-dir $(DATA_DIR)/ $< --output $@

$(SRC_DIR)/storage.ign: $(SRC_DIR)/storage.bu
	$(BU) $(BUFLAGS) $< --output $@

$(SRC_DIR)/users.ign: $(SRC_DIR)/users.bu $(DATA_DIR)/id_ed25519.pub
	$(BU) $(BUFLAGS) --files-dir $(DATA_DIR)/ $< --output $@

clean:
	rm -f $(SRC_DIR)/*.ign *.ign
