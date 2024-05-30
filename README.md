## Setup

1. **Copy the .env.example file to a new file named .env**

    You can do this by running the following command in your terminal:

    ```bash
    cp .env.example .env
    ```

2. **Fill the environment variables in the .env file**

    Open the .env file and fill in the values for the environment variables. For example, you might have a variable like this in your .env file:

    ```properties
    SUPABASE_ANON_KEY=your_key_here
    ```

    Replace `your_key_here` with your actual key.

3. **Execute the build_runner command**

    Run the following command in your terminal:

    ```bash
    dart run build_runner build -d
    ```

4. **Run the Flutter application**

    Finally, you can run the Flutter application with the following command:

    ```bash
    flutter run
    ```

That's it! Your Flutter application should now be running.