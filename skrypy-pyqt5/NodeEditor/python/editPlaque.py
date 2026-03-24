from PyQt5.QtWidgets import QDialog, QVBoxLayout, QHBoxLayout, QLineEdit,\
    QPushButton, QWidget, QLabel, QCheckBox, QSpinBox, QDoubleSpinBox,\
    QScrollArea


class EditDialog(QDialog):
    def __init__(self, info_dict):
        super().__init__()
        self.setWindowTitle("Éditeur intelligent")
        self.info_dict = info_dict.copy()
        self.widgets = {}

        self.layout = QVBoxLayout()
        self.fields_container = QWidget()
        self.fields_layout = QVBoxLayout()
        self.fields_container.setLayout(self.fields_layout)

        self.scroll = QScrollArea()
        self.scroll.setWidgetResizable(True)
        self.scroll.setWidget(self.fields_container)

        self.layout.addWidget(self.scroll)

        self.build_fields()

        btn_layout = QHBoxLayout()
        add_btn = QPushButton("Add")
        add_btn.clicked.connect(self.add_field)

        save_btn = QPushButton("Save")
        save_btn.clicked.connect(self.accept)

        btn_layout.addWidget(add_btn)
        btn_layout.addWidget(save_btn)
        self.layout.addLayout(btn_layout)

        self.setLayout(self.layout)

    def build_fields(self):
        for key, value in self.info_dict.items():
            self.add_field(key, value)

    def add_field(self, key="", value=""):
        row = QHBoxLayout()

        if not key:
            key = 'new key'
            value = 'new value'
        key_edit = QLineEdit(str(key))
        value_widget = QLineEdit(str(value))

        del_btn = QPushButton("del")
        del_btn.setFixedWidth(30)

        container = QWidget()
        container.setLayout(row)

        def delete():
            self.fields_layout.removeWidget(container)
            if container in self.widgets:
                del self.widgets[container]
            container.deleteLater()

        del_btn.clicked.connect(delete)

        row.addWidget(QLabel("Key"))
        row.addWidget(key_edit)
        row.addWidget(QLabel("Value"))
        row.addWidget(value_widget)
        row.addWidget(del_btn)

        self.fields_layout.addWidget(container)
        self.widgets[container] = (key_edit, value_widget)

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