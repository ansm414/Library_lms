class Admins::CategoriesController < ApplicationController
    def index
        @q=Category.ransack(params[:q])
        @categories=@q.result(distinct: true).page(params[:page])
        authorize([:Admin,@categories])
    end

    def show
        @category=Category.find(params[:id])
        authorize([:Admin,@category])

    end

    def new 
        @category= Category.new
        authorize([:Admin,@category])

    end

    def create
        @category= Category.new(category_params)
        authorize([:Admin,@category])

        if @category.save
            redirect_to admins_categories_path, notice: "Category has been created Successfully"
        else
            render :new
        end
    end

    def edit
        @category=Category.find(params[:id])
        authorize([:Admin,@category])

    end

    def update
        @category=Category.find(params[:id])
        authorize([:Admin,@category])

        if @category.update(category_params)
            redirect_to admins_categories_path
        else
            render :edit
        end
    end

    def destroy
        @category=Category.find(params[:id])
        
        authorize([:Admin,@category])
        if @category.destroy
        
            redirect_to admins_categories_path,alert: "Category has been deleted", status: 303
        else
            
        end
    end

    private
        def category_params
            params.require(:category).permit(:name);
        end
end
