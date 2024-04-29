<script>
    import {goto} from '$app/navigation';
    function navigationTostress() {
        goto('/api/diary/stress');
    } 
    function navigationToenergi() {
        goto('/api/diary/energi');

    } function navigationTougeplan() {
        goto('/home');
    } 

    const logout = async () => {
        const response = await fetch('/api/logud', {
            method: 'GET'
        });
        if (response.status === 200) {
            alert('Du er logget ud!');
            window.location = '/'; 
        } else {
            alert('Der opstod en fejl under log ud-processen.');
        }
    };

</script>
<div class="image-container">
    <img src="/logo.png" alt="Logo">
</div>

<style> img{
    width: 20%;
    float: center;
}

.image-container {
    display: flex; 
    justify-content: center; 
    align-items: center;
    height: 30vh; 
  }

.button-container {
        text-align: center; 
        margin-top: 20px; 

}
    button {
        background-color: #42a5f5;
        color: white; 
        border: none; 
        padding: 20px 30px; 
        margin: 5px; 
        border-radius: 10px; 
    }

.logud{
    float: right;
    margin-top: 400px;

}

</style>


<div class="button-container">
    <button on:click={navigationTostress}>Hvad gør dig stresset?</button>
    <button on:click={navigationToenergi}>Hvad giver dig energi?</button>
    <button on:click={navigationTougeplan} >Ugeplan</button>
</div>

<div class="logud">
    <button on:click={logout}>Log ud</button>    
</div>
