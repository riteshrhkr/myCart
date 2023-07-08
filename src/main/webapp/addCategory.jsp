<!-- Classes to triger model
data-bs-toggle="modal" data-bs-target="#exampleModal"
Here #exampleModel is ID to  trigger the model who have this ID
    Open Scrollable Modal
</button> -->

<!-- Scrollable Modal -->

<div class="modal fade" id="addCategory" tabindex="-1" aria-labelledby="addCategoryLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryLabel">Add New Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div style="max-height: 300px; overflow-y: auto;">
                    <!-- This is the part that will show  -->
                    <form action="AddCategoryServlet" method = "post">
                        <!-- Category Title -->
                        <div class="mb-1">
                            <label for="categoryTitle" class="form-label">Title</label>
                            <input type="text" class="form-control" id="categoryTitle" name="categoryTitle"
                                autocomplete="off" placeholder="Enter category title" required>
                        </div>
                        <!-- Category Description -->
                        <div class="mb-1">
                            <label for="categoryDescription" class="form-label">Description</label>
                            <textarea name="categoryDescription" class="form-control" style="height: 7rem;"></textarea>
                        </div>
                        <button type="submit" class="btn btn-outline-success">Add</button>
                        <!-- Button to dismiss model -->
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancle</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>