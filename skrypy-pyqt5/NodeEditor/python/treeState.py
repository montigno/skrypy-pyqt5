from PyQt5.QtCore import QSettings

def save_tree_state(self):
    settings = QSettings("MonApp", "Explorateur")
    
    # Colonnes (largeur)
    header = self.tree.header()
    widths = [header.sectionSize(i) for i in range(header.count())]
    settings.setValue("header_widths", widths)
    
    # Tri
    settings.setValue("sort_column", header.sortIndicatorSection())
    settings.setValue("sort_order", int(header.sortIndicatorOrder()))
    
    # État des items (expand/collapse)
    expanded = []
    def recurse(index):
        for row in range(self.model.rowCount(index)):
            child = self.model.index(row, 0, index)
            if self.tree.isExpanded(child):
                expanded.append(self.model.filePath(child))
                recurse(child)
    recurse(QModelIndex())
    settings.setValue("expanded_paths", expanded)
    
    # Sélection
    selected = [self.model.filePath(idx) for idx in self.tree.selectionModel().selectedIndexes() if idx.column() == 0]
    settings.setValue("selected_paths", selected)
    
    # Scroll (position verticale)
    settings.setValue("scroll_pos", self.tree.verticalScrollBar().value())
    

def restore_tree_state(self):
    settings = QSettings("MonApp", "Explorateur")
    
    # Colonnes
    header = self.tree.header()
    widths = settings.value("header_widths", [])
    for i, w in enumerate(widths):
        header.resizeSection(i, int(w))
    
    # Tri
    sort_col = int(settings.value("sort_column", 0))
    sort_order = Qt.SortOrder(int(settings.value("sort_order", Qt.AscendingOrder)))
    self.tree.sortByColumn(sort_col, sort_order)
    
    # Expand
    expanded = settings.value("expanded_paths", [])
    for path in expanded:
        idx = self.model.index(path)
        if idx.isValid():
            self.tree.expand(idx)
    
    # Sélection
    selected = settings.value("selected_paths", [])
    self.select_files(selected)  # fonction que tu avais déjà pour sélectionner par chemin
    
    # Scroll
    scroll_pos = int(settings.value("scroll_pos", 0))
    self.tree.verticalScrollBar().setValue(scroll_pos)