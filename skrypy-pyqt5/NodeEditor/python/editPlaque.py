from PyQt5.QtWidgets import QDialog, QVBoxLayout, QHBoxLayout, QLineEdit,\
    QPushButton, QWidget, QLabel, QCheckBox, QSpinBox, QDoubleSpinBox


class EditDialog(QDialog):
    def __init__(self, info_dict):
        super().__init__()
        self.setWindowTitle("Éditeur intelligent")
        self.info_dict = info_dict.copy()
        self.widgets = {}

        self.layout = QVBoxLayout()
        self.fields_layout = QVBoxLayout()
        self.layout.addLayout(self.fields_layout)

        self.build_fields()

        btn_layout = QHBoxLayout()
        add_btn = QPushButton("➕ Ajouter")
        add_btn.clicked.connect(self.add_field)

        save_btn = QPushButton("💾 Enregistrer")
        save_btn.clicked.connect(self.accept)

        btn_layout.addWidget(add_btn)
        btn_layout.addWidget(save_btn)
        self.layout.addLayout(btn_layout)

        self.setLayout(self.layout)

    # =====================
    # Création dynamique
    # =====================
    def create_widget(self, value):
        if isinstance(value, bool):
            w = QCheckBox()
            w.setChecked(value)
        elif isinstance(value, int):
            w = QSpinBox()
            w.setRange(-1_000_000, 1_000_000)
            w.setValue(value)
        elif isinstance(value, float):
            w = QDoubleSpinBox()
            w.setRange(-1e9, 1e9)
            w.setDecimals(3)
            w.setValue(value)
        else:
            w = QLineEdit(str(value))
        return w

    def build_fields(self):
        for key, value in self.info_dict.items():
            self.add_field(key, value)

    def add_field(self, key="", value=""):
        row = QHBoxLayout()

        key_edit = QLineEdit(str(key))
        value_widget = self.create_widget(value)

        del_btn = QPushButton("❌")
        del_btn.setFixedWidth(30)

        container = QWidget()
        container.setLayout(row)

        def delete():
            container.setParent(None)

        del_btn.clicked.connect(delete)

        row.addWidget(QLabel("Clé"))
        row.addWidget(key_edit)
        row.addWidget(QLabel("Valeur"))
        row.addWidget(value_widget)
        row.addWidget(del_btn)

        self.fields_layout.addWidget(container)
        self.widgets[container] = (key_edit, value_widget)

    # =====================
    # Récupération valeurs
    # =====================
    def get_value(self, widget):
        if isinstance(widget, QCheckBox):
            return widget.isChecked()
        elif isinstance(widget, QSpinBox):
            return widget.value()
        elif isinstance(widget, QDoubleSpinBox):
            return widget.value()
        elif isinstance(widget, QLineEdit):
            text = widget.text()

            # tentative conversion auto
            if text.lower() in ("true", "false"):
                return text.lower() == "true"
            try:
                if "." in text:
                    return float(text)
                return int(text)
            except:
                return text

        return None

    def get_info(self):
        new_dict = {}
        for key_edit, value_widget in self.widgets.values():
            key = key_edit.text().strip()
            if key:
                new_dict[key] = self.get_value(value_widget)
        return new_dict