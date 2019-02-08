package Processes;

/** A block is two ints for block instance and block length
 * and a string for the type of resource needed
 * Blocks are generated by the block generator class for process objects
 */

public class Block {

    /**
     * is the block instance
     */
    public int BI;
    /**
     *is the recourse type
     */
    public String R;
    /**
     *is the block time
     */
    public int BT;

    /**
     * constructor for empty block object
     */
    public Block(){

    };

    /**
     * sets all block info
     * @param bi is the block instance
     * @param r is the recourse type
     * @param bt is the block time
     */
    public Block(int bi, String r, int bt) {
        this.BI = bi;
        this.R = r;
        this.BT = bt;
    }

    /**
     * gets block instance
     * @return BI is block instance
     */
    public int getBI() {
        return this.BI;
    }

    /**
     * gets the resource type
     * @return R is the resource type
     */
    public String getR() {
        return this.R;
    }

    /**
     * gets the block time
     * @return BT is block time
     */
    public int getBT() {
        return this.BT;
    }

    /**
     * updateBI mutates the block instance to be the given val
     * @param  val    int   the given value
     */
    public void updateBI(int val){
        this.BI = val;
    }

    /**
     * updateR mutates the block resource to be the given val
     * @param  val    String   the given value
     */
    public void updateR(String val){
        this.R = val;
    }

    /**
     * updateBT mutates the block time to be the given val
     * @param  val    int   the given value
     */
    public void updateBT(int val){
        this.BT = val;
    }

    /**
     * to print the block for debugging
     */
    public String toString(){
        String theBlock = String.format("(%d, %s, %d)",
                this.getBI(), this.getR(), this.getBT());
        return theBlock;
    }
}