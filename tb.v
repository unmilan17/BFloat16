`timescale 1ns / 1ps

module bfloat_alu_tb;

  reg clk;
  wire [15:0] result;

  // Instantiate the bfloat_alu module
  bfloat_alu uut (
    .clk(clk),
    .result(result)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz clock
  end

  // Test procedure
  initial begin
    // Display header for the results
    $display("Time\tResult (Hex)");
    
    // Monitor result changes
    $monitor("%0t\t%h", $time, result);
    
    // Run the simulation for a few clock cycles (enough to process all operations)
    #1000;  // Adjust this based on how long your simulation takes
    
    // Stop simulation after enough time
    $stop;
  end

endmodule


// `timescale 1ns / 1ps

// module bfloat_alu_tb;

//   reg clk;
//   wire [15:0] result;
//   wire [15:0] m_before, m_after;

//   // Instantiate the bfloat_alu module
//   bfloat_alu uut (
//     .clk(clk),
//     .result(result),
//     .m_before_rounding(m_before),
//     .m_after_rounding(m_after)
//   );

//   // Clock generation
//   initial begin
//     clk = 0;
//     forever #5 clk = ~clk; // 100 MHz clock
//   end

//   // Test procedure
//   initial begin
//     $display("Time\t\tResult (Hex)\tMantissa Before Rounding\tMantissa After Rounding");
//     $monitor("%0t\t%h\t\t%b\t\t\t%b", $time, result, m_before, m_after);
    
//     #1000;  // Run simulation
//     $stop;
//   end

// endmodule
