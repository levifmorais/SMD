
class BinaryTreeNode:
    def __init__(self, data):
        self.left = None
        self.right = None
        self.data = data
 
class BinaryTree:
    
    def __init__(self):
        self.root = None

    def insert(self, data):
        if self.root is None:
            self.root = BinaryTreeNode(data)
        else:
            self._insert(self.root, data)
    
    def _insert(self, node, data):
        if data < node.data:
            if node.left:
                self._insert(node.left, data)
            else:
                node.left = BinaryTreeNode(data)
        else:
            if node.right:
                self._insert(node.right, data)
            else:
                node.right = BinaryTreeNode(data)

    def inOrderTraverse(self, root):
        if root:
            self.inOrderTraverse(root.left)
            print(root.data, end = ' ')
            self.inOrderTraverse(root.right)

    def preOrderTraverse(self, root):
        if root:
            print(root.data, end = ' ')
            self.preOrderTraverse(root.left)
            self.preOrderTraverse(root.right)

    def postOrderTraverse(self, root):
        if root:
            self.postOrderTraverse(root.left)
            self.postOrderTraverse(root.right)
            print(root.data, end = ' ')

tree = BinaryTree()
tree.insert(11)
tree.insert(9)
tree.insert(3)
tree.insert(10)
tree.insert(15)
tree.insert(13)

print('\ninOrderTraverse:')
tree.inOrderTraverse(tree.root)
print('\npreOrderTraverse:')
tree.preOrderTraverse(tree.root)
print('\npostOrderTraverse:')
tree.postOrderTraverse(tree.root)

"""def insert(root, data):
    if root is None:
        return BinaryTreeNode(data)
    else:
        if root.data == data:
            return root
        elif root.data < data:
            root.right = insert(root.right, data)
        else:
            root.left = insert(root.left, data)
    return root

def inOrderTraverse(root):
    if root:
        inOrderTraverse(root.left)
        print(root.data, end = ' ')
        inOrderTraverse(root.right)

def preOrderTraverse(root):
    if root:
        print(root.data, end = ' ')
        preOrderTraverse(root.left)
        preOrderTraverse(root.right)

def postOrderTraverse(root):
    if root:
        postOrderTraverse(root.left)
        postOrderTraverse(root.right)
        print(root.data, end = ' ')

root = None
root = insert(root, 8)
root = insert(root, 3)
root = insert(root, 1)
root = insert(root, 6)
root = insert(root, 7)
root = insert(root, 10)
root = insert(root, 14)
root = insert(root, 4)

print('\ninOrderTraverse:')
inOrderTraverse(root)
print('\npreOrderTraverse:')
preOrderTraverse(root)
print('\npostOrderTraverse:')
postOrderTraverse(root)

print("\n \n") """
