<?php
namespace LuisRovirosa;
use PHPUnit\Framework\TestCase;

class GiveAProperNameTest extends TestCase
{
    /** @test */
    public function please_rename_me_or_delete_me()
    {
        $myObject = new GiveAProperName();
        $this->assertTrue($myObject->giveMeAProperName());
    }
}